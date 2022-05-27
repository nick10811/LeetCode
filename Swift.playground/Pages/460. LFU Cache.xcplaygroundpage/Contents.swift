import Foundation

class LFUCache {
    
    var capacity: Int = 0 // max
    var minFreq: Int = 0
    var freqDict: [Int : LinkedList] = [ : ] // (freq, linkedlist)
    var keyDict: [Int : LinkedListNode] = [ : ] // (key, node)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.minFreq = Int.max
    }
    
    func get(_ key: Int) -> Int {
        if let dic = keyDict.first { $0.key == key } {
            // add frequency
            addFrequency(dic.value, withFrequency: dic.value.freq)
            return dic.value.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        // create node and set keyDict
        var freq = 0
        var node: LinkedListNode? = nil
        if let dic = keyDict.first{ $0.key == key } {
            // exsiting node
            node = dic.value
            node?.val = value
            freq = node?.freq ?? 0
            
        } else {
            // non-existing node
            node = LinkedListNode(key: key, value: value, freq: 0)
            keyDict[key] = node
        }
        
        guard let node = node else { return }
        
        addFrequency(node, withFrequency: freq)
        
        if capacity == 0 {
            freqDict.removeAll()
            keyDict.removeAll()
        }
        
        if keyDict.count > capacity {
            let (list, node) = findMinFrequency(node)
            if let minNode = node {
                list?.deleteNode(node: minNode)
                keyDict.removeValue(forKey: minNode.key)
            }
        }
        
    }
    
    func addFrequency(_ node: LinkedListNode, withFrequency freq: Int) {
        node.freq += 1
        
        // remove node
        if let dic = freqDict.first { $0.key == freq} {
            // exsiting frequency
            let list = dic.value
            list.deleteNode(node: node)
        }
        
        // set FreqDic
        if let dic = freqDict.first { $0.key == freq + 1} {
            // exsiting frequency
            let list = dic.value
            list.append(node: node)
        } else {
            // non-existing frequency
            let list = LinkedList()
            list.append(node: node)
            freqDict[node.freq] = list
        }
        
    }
    
    func findMinFrequency(_ current: LinkedListNode) -> (LinkedList?, LinkedListNode?) {
        let sorted = freqDict.sorted { $0.key < $1.key }
        for i in 0..<sorted.count {
            // (key, value) -> (freq, linkedlist)
            let list = sorted[i].value
            var node: LinkedListNode? = list.head
            while node != nil {
                if node!.key != current.key {
                    return (list, node)
                }
                node = node?.next
            }
        }
        return (nil, nil)
    }
    
    func Print() -> String {
            var to_print: String = ""
            for (int_val, node_val) in self.keyDict {
                to_print += "("
                to_print += String(int_val)
                to_print += ", "
                to_print += String(node_val.val)
                to_print += " | "
                to_print += String(node_val.freq)
                to_print += ")"
            }
            return to_print
        }
}

class LinkedListNode{
    
    var key: Int = 0
    var val: Int = 0
    var freq: Int = 0
    var next: LinkedListNode? = nil
    var prev: LinkedListNode? = nil
    
    init(key: Int, value: Int, freq: Int){
        self.key = key
        self.val = value
        self.freq = freq
        self.next = nil
        self.prev = nil
    }
}

class LinkedList{
    
    var head: LinkedListNode? = nil
    var tail: LinkedListNode? = nil
    
    init(){
        self.head = nil
        self.tail = nil
    }
    
    func append(node: LinkedListNode){
        node.next = nil
        node.prev = nil
        if self.head == nil {
            self.head = node
        }
        else{
            self.tail!.next = node
            node.prev = self.tail
        }
        self.tail = node
    }
    
    func deleteNode(node: LinkedListNode){
        if node.prev != nil {
            node.prev!.next = node.next
        }
        else{
            self.head = node.next
        }
        
        if node.next != nil {
            node.next!.prev = node.prev
        }
        else{
            self.tail = node.prev
        }
        node.next = nil
        node.prev = nil
    }
}

var lfu = LFUCache(2)

//lfu.put(1, 1)
//lfu.put(2, 2)
//lfu.get(1)
//lfu.put(3, 3)
//lfu.get(2)
//lfu.get(3)
//lfu.put(4, 4)
//lfu.get(1)
//lfu.get(3)
//lfu.get(4)
//print(lfu.Print())

//lfu.put(3,1)
//lfu.put(2,1)
//print(lfu.Print())
//lfu.put(2,2)
//print(lfu.Print())
//lfu.put(4,4)
//lfu.get(2)
//print(lfu.Print())

lfu = LFUCache(0)
lfu.put(0, 0)
print(lfu.Print())
lfu.get(0)
print(lfu.Print())
