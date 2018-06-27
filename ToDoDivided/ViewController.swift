
import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var itemArray  = [Item]()
    
    //let defaults = UserDefaults.standard
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    //MARK: - TV data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "goToItems", for: indexPath)
        //dont use item obj for item
        let item = itemArray[indexPath.row]
        cell.textLabel?.text =  itemArray[indexPath.row].title

        //value = condition ? valueT : valueF
        //cell.accessoryType = item.done ? .checkmark : .none
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    //MARK:- Add new item
    
    
    
    
    @IBAction func AddButtonClicked(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false

            
            self.itemArray.append(newItem)
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new"
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func saveItems(){
        do{
            try context.save()
        }catch{ print("error saving data : \(error)")}
        tableView.reloadData()
    }
    
    
    func loadItems(){
        
        let request :NSFetchRequest<Item> = Item.fetchRequest()
        
        do{
            itemArray = try context.fetch(request)
        }catch{ print("error loading data : \(error)")}
        tableView.reloadData()
    }

}
