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
  print(a.showLinkedList());
}
//count=1 < 9 → temp=20, count=2

//count=2 < 9 → temp=30, count=3

//count=3 < 9 → temp=null, count=4
