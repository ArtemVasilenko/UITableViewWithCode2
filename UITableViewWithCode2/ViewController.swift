
import UIKit

class ViewController: UIViewController {
    
    var myTableView = UITableView()
    var myCell = "Cell"
    var boys = ["Nikolay", "Aristarh", "Boris"]
    var girls = ["Anna", "Galya", "Ilona", "Asya"]

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: myCell)
        myTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return boys.count
        case 1: return girls.count
        default: ()
        }
        
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: myCell, for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = boys[indexPath.row]
            cell.backgroundColor = .blue
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.text = girls[indexPath.row]
            cell.backgroundColor = UIColor.purple
            cell.accessoryType = .detailButton
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Pacan4iki"
        case 1: return "Tyofanki"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: print(boys[indexPath.row])
        case 1: print(girls[indexPath.row])
        default: break
        }
        
    }
    
    
}
