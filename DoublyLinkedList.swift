//
//  DoublyLinkedList.swift
//  TestingUIKit
//
//  Created by Nitin Bhatt on 7/25/22.
//

import Foundation
import UIKit


class LinkedListViewController:UIViewController{
    
    var head:SinglyLinkedListNode?
    var doublyList = DoublyLinkedList()
   
    override func viewDidLoad() {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        doublyList.insert(value: 1)
        doublyList.insert(value: 2)
        doublyList.insert(value: 3)
        doublyList.insert(value: 4)
        print("Traverse Doubly Linked List")
        print(doublyList.traverse())
        
        print("Reverse Doubly Linked List")
        doublyList.reverse()
        doublyList.traverse()
    }
}

class DoublyLinkedList{
    var head:DoublyLinkedListNode?
    
    //REVERSE
    func reverse(){
        
        var prevNode:DoublyLinkedListNode? = nil
        var currentNode = head
        
        while(currentNode != nil){
            let headNode = currentNode?.next
            currentNode?.next = prevNode
            currentNode?.prev = prevNode
            prevNode = currentNode
            currentNode = headNode
        }
        
        head = prevNode
    }
    
    // INSERT
    func insert(value:Int){
        if head == nil{
            head = DoublyLinkedListNode(value: value, prev: nil, next: nil)
            return
        }
        
        var current = head
        
        while(current?.next != nil){
            current = current?.next
        }
        
        current?.next = DoublyLinkedListNode(value: value, prev: current, next: nil)
    }
    
    // TRAVERSE
    
    func traverse(){
        var current = head
        while(current != nil){
            print(current?.value ?? "","Previous Node Value", current?.prev?.value ?? "Nil")
            current = current?.next
        }
    }
}

class DoublyLinkedListNode{
    var value:Int
    var prev:DoublyLinkedListNode?
    var next:DoublyLinkedListNode?
    
    init(value:Int,prev:DoublyLinkedListNode?,next:DoublyLinkedListNode?){
        self.value = value
        self.prev = prev
        self.next = next
    }
}


