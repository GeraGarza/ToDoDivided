
import UIKit
import RealmSwift

class TodoListViewController: UITableViewController {
    
    
    let realm = try! Realm()
    var itemToDo : Results<Item>?
    
    //let defaults = UserDefaults.standard
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()

    }
    
    //MARK: - TV data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //nil coalescing operator
        return itemToDo?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "goToItems", for: indexPath)
        
        
        if let item = itemToDo?[indexPath.row]{
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
            
        }else{
            cell.textLabel?.text = "no Items"
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        if let item = itemToDo?[indexPath.row]{
            do{
                try realm.write {
                    item.done = !item.done
                    }
                }catch{
                    print(error)
                }
        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    //MARK:- Add new item
    
    
    @IBAction func AddButtonClicked(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newitem = Item()
            newitem.title = textField.text!
            self.save(item: newitem)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new"
            textField = alertTextField
        }
        alert.addAction(action)

        present(alert, animated: true)
    }
    
    func save(item : Item){

    do{
        try realm.write {
            realm.add(item)
        }
    }catch{
    print(error)
    }
    tableView.reloadData()
    }
    
    
    func loadItems(){
        
        itemToDo = realm.objects(Item.self)
        //itemsArray = selectedCategory?.items.sorted(byKeyPath:
        //"title", ascending: true)
        tableView.reloadData()

        
    }

}
