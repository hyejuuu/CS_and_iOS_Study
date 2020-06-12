import Cocoa

struct Vertex<T>: Hashable {
    let index: Int
    let data: T
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
    
    static func == (lhs: Vertex<T>,
                    rhs: Vertex<T>) -> Bool {
        return lhs.index == rhs.index
    }
}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(data)"
    }
}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Int?
}

class Graph<T> {
    var vertices: [Vertex<T>] = []
    var weights: [[Int?]] = []
    
    init() {}
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        
        for i in 0..<weights.count {
            weights[i].append(nil)
        }
        let row: [Int?] = Array(repeating: nil, count: vertices.count)
        weights.append(row)
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>,
                         to destination: Vertex<T>,
                         weight: Int?) {
        weights[source.index][destination.index] = weight
    }
    
    func addUndirectedEdge(between source: Vertex<T>,
                           and destination: Vertex<T>,
                           weight: Int?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        var edges: [Edge<T>] = []
        for column in 0..<weights.count {
            if let weight = weights[source.index][column] {
                edges.append(Edge(source: source,
                                  destination: vertices[column],
                                  weight: weight))
            }
        }
      return edges
    }
    
    func weight(from source: Vertex<T>,
                to destination: Vertex<T>) -> Int? {
        return weights[source.index][destination.index]
    }
}

extension Graph: CustomStringConvertible {
    public var description: String {
        var grid: [String] = []
        
        for i in 0..<weights.count {
            var row = ""
            for j in 0..<weights.count {
                if let value = weights[i][j] {
                    row += "\(value)\t\t"
                } else {
                    row += "0\t\t"
                }
            }
            grid.append(row)
        }
        let edgesDescription = grid.joined(separator: "\n")
        return "\(edgesDescription)"
    }
}

let graph = Graph<Int>()
let vertext1 = graph.createVertex(data: 1)
let vertext2 = graph.createVertex(data: 2)
let vertext3 = graph.createVertex(data: 3)
let vertext4 = graph.createVertex(data: 4)
let vertext5 = graph.createVertex(data: 5)

graph.addUndirectedEdge(between: vertext1, and: vertext2, weight: 10)
graph.addUndirectedEdge(between: vertext1, and: vertext3, weight: 20)
graph.addUndirectedEdge(between: vertext2, and: vertext3, weight: 50)
graph.addUndirectedEdge(between: vertext3, and: vertext4, weight: 30)
graph.addUndirectedEdge(between: vertext3, and: vertext5, weight: 10)
print(graph)
