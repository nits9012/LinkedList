//
//  SinglyLinkedList.swift
//  TestingUIKit
//
//  Created by Nitin Bhatt on 7/25/22.
//

import Foundation
import UIKit


class LinkedListViewController:UIViewController{
    
    var head:SinglyLinkedListNode?
    
    var linkedList = SinglyLinkedList()
   
    override func viewDidLoad() {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Insert Values
        
        linkedList.insert(value: 1)
        linkedList.insert(value: 2)
        linkedList.insert(value: 3)
        linkedList.insert(value: 4)
        linkedList.insert(value: 5)
        linkedList.insert(value: 6)
        linkedList.insert(value: 7)
        
        // Traverse
        print("Traverse Linked List")
        linkedList.traveseLinklist()
        
        // Insert
        print("Insert node at first value 0")
        linkedList.insertNodeAtFirst(value: 0)
        print("Insert node at last value 8")
        linkedList.insertNodeAtLast(value: 8)
        
        //
        print("Linked List after insertion at first and last")
        linkedList.traveseLinklist()
        
        // Deletion
        print("Delete value from linked list 6")
        linkedList.deleteValue(value: 6)
        linkedList.traveseLinklist()
        
        // Reverse
        linkedList.reverseLinkedList()
        print("Linked List after reverse")
        linkedList.traveseLinklist()
    }
}


class SinglyLinkedListNode{
    var value:Int?
    var next:SinglyLinkedListNode?
    
    init(value:Int,next:SinglyLinkedListNode?){
        self.value = value
        self.next = next
    }
}


class SinglyLinkedList{
    
    var head:SinglyLinkedListNode?
    
    // TRAVERSE
    func traveseLinklist(){
        var currentNode = head
        while(currentNode != nil){
            print(currentNode?.value ?? "")
            currentNode = currentNode?.next
        }
    }
    
    // REVERSE
    
    func reverseLinkedList(){
        var prev:SinglyLinkedListNode? = nil
        var current = head
        
        while(current != nil){
            let headNode = current?.next
            current?.next = prev
            prev = current
            current = headNode
        }
        
       head = prev
    }
    
    // INSERT
        
    func insert(value:Int){
        if head == nil{
            head = SinglyLinkedListNode(value: value, next: nil)
            return
        }
        
        var currentNode = head
        
        while(currentNode?.next != nil){
            currentNode = currentNode?.next
        }

        currentNode?.next = SinglyLinkedListNode(value: value, next: nil)
    }
    
    func insertNodeAtFirst(value:Int){
        let node = SinglyLinkedListNode(value: value, next: nil)
        node.next = head
        head = node
    }
    
    func insertNodeAtLast(value:Int){
        let node = SinglyLinkedListNode(value: value, next: nil)
        
        var current = head
        
        while(current?.next != nil){
            current = current?.next
        }
        current?.next = node
    }
    
    
    // DELETE
    func deleteValue(value:Int){
        
        if head?.value == value{
            head = head?.next
        }
        
        var current = head
        var prev:SinglyLinkedListNode?
        
        while (current != nil) && (current?.value != value){
            prev = current
            current = current?.next
        }

        prev?.next = current?.next
    }
}

