
import UIKit

class TodoListViewController: UITableViewController {
    
    
    
    var itemArray  = [Item]()

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
            
            itemArray = items
            
        }

        let newItem = Item()
        
        newItem.title = "1"
        
        itemArray.append(newItem)
        
    }
    
    
    
    //MARK: - TV data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell = tableView.dequeueReusableCell(withIdentifier: "goToItems", for: indexPath)
        
        let item =  itemArray[indexPath.row]
 
        cell.textLabel?.text = item.title
        

        //value = condition ? valueT : valueF
        
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
   
    }
    
    //MARK:- Add new item
    
    @IBAction func AddBottonClicked(_ sender: UIBarButtonItem) {
   
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            
            newItem.title = textField.text!
            
            // self.itemArray.append(textField.text!)
            
            self.itemArray.append(newItem)
            
            self.defaults.setValue(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new"
            
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
        
        
        
    }
    

 
}
