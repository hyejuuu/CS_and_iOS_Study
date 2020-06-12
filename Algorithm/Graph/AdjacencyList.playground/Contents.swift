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
}

class Graph<T> {
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>,
                         to destination: Vertex<T>) {
        let edge = Edge(source: source,
                        destination: destination)
        adjacencies[source]?.append(edge)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
}

extension Graph: CustomStringConvertible {
    var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex): [ \(edgeString) ]\n")
        }
        return result
    }
}

let graph = Graph<Int>()
let vertext1 = graph.createVertex(data: 1)
let vertext2 = graph.createVertex(data: 2)
let vertext3 = graph.createVertex(data: 3)
let vertext4 = graph.createVertex(data: 4)
let vertext5 = graph.createVertex(data: 5)

graph.addDirectedEdge(from: vertext1, to: vertext2)
graph.addDirectedEdge(from: vertext1, to: vertext3)
graph.addDirectedEdge(from: vertext2, to: vertext3)
graph.addDirectedEdge(from: vertext3, to: vertext4)
graph.addDirectedEdge(from: vertext3, to: vertext5)
print(graph)
