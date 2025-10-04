//class for node

class Node {
  int data;
  Node? prev;
  Node? next;
  Node(this.data);
}

//class for double linked list
class DoubleLinkedList {
  Node? head;

  //function for adding values in the double linked list

  //insert at begin
  void insertAtBegin(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      return;
    }
    newNode.next = head;
    head!.prev = newNode;
    head = newNode;
  }

  //add data at the end of the linked list
  void addAtLast(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      return;
    }
    Node? temp = head!;
    while (temp!.next != null) {
      temp = temp.next;
    }
    temp.next = newNode;
    newNode.prev = temp;
  }

  //add element at the specific position
  void insertAtPosition(int data, int position) {
    if (position < 1) {
      insertAtBegin(data);
      return;
    }
    Node? temp = head!;
    Node? newNode = Node(data);
    int count = 1;
    while (temp != null && count < position - 1) {
      temp = temp.next;
      count++;
    }
    if (temp == null || temp.next == null) {
      addAtLast(data);
      return;
    }
    newNode.next = temp.next;
    newNode.prev = temp;
    temp.next!.prev = newNode;
    temp.next = newNode;
  }
  // endding of adding value in the double linked list

  //deleting vlaue from the double linked list

  //delete first value at the double linked list
  void deleteAtBegin() {
    if (head == null) {
      return;
    }
    head = head!.next;
    if (head != null) {
      head!.prev = null;
    }
  }

  //delete last value at the linked list
  void deleteAtEnd() {
    if (head == null) {
      return;
    }
    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    temp.prev!.next = null;
  }

  //delete at any position of the class
  void deleteAtPostion(int position) {
    if (head == null) {
      return;
    }
    if (position == 1) {
      deleteAtBegin();
    }
    Node? temp = head;
    int count = 1;
    while (temp != null && count < position) {
      temp = temp.next;
      count++;
    }
    if (temp == null) {
      return;
    }
    if (temp.prev != null) {
      temp.prev!.next = temp.next;
    }
    if (temp.next != null) {
      temp.next!.prev = temp.prev;
    }
  }

  // move list in the backward way
  List<int> showReversedLinkedList() {
    if (head == null) {
      return [];
    }
    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    List<int> storedData = [];
    while (temp != null) {
      storedData.add(temp.data);
      temp = temp.prev;
    }
    return storedData;
  }

  //find a value in the linked list
  void findValue(int data) {
    if (head == null) {
      return print("The linked list is empty ");
    }
    Node? temp = head;
    while (temp != null) {
      if (temp.data == data) {
        print("We found the value :$data");
        return;
      }
      temp = temp.next;
    }
    print("There is no such type of value :$data");
  }

  //update the functin
  void updataValue(int oldValue, int newValue) {
    if (head == null) {
      return print("List is null");
    }
    Node? temp = head;
    while (temp != null) {
      if (temp.data == oldValue) {
        temp.data = newValue;
        print("value updated $oldValue -> $newValue");
        return;
      }
      temp = temp.next;
    }
    print("There is no such type of value in the list :$oldValue");
  }

  //show the whole linkedList
  List<int> showLinkedList() {
    Node? temp = head!;
    List<int> storedData = [];
    while (temp != null) {
      storedData.add(temp.data);
      temp = temp.next;
    }
    return storedData;
  }
}

void main() {
  DoubleLinkedList a = DoubleLinkedList();
  a.insertAtBegin(20);
  a.insertAtBegin(30);
  a.addAtLast(40);
  a.addAtLast(50);
  a.insertAtPosition(11, 1);
  a.insertAtPosition(44, 3);
  // a.findValue(110);
  // a.findValue(40);
  // a.deleteAtBegin();
  // a.deleteAtEnd();
  // a.deleteAtPostion(3);
  // a.deleteAtPostion(2);
  a.updataValue(30, 300);
  print(a.showLinkedList());
  //print(a.showReversedLinkedList());
}
//count=1 < 9 → temp=20, count=2

//count=2 < 9 → temp=30, count=3

//count=3 < 9 → temp=null, count=4
