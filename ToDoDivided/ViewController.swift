
import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray  = ["one","two"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        

    }
    
    //MARK: - TV data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "goToItems", for: indexPath)
        
        let item =  itemArray[indexPath.row]
        
        cell.textLabel?.text = item
        
        
        //value = condition ? valueT : valueF
       // cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    //MARK:- Add new item
    
    
    @IBAction func AddButtonClicked(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!)

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
