//
//  AddLoverTableViewController.swift
//  Demo
//
//  Created by Peter Pan on 20/12/2016.
//  Copyright © 2016 Peter Pan. All rights reserved.
//

import UIKit

class AddLoverTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var selectPhotoBut: UIButton!

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectPhotoBut.setBackgroundImage(image, for: .normal)
        selectPhotoBut.setTitle(nil, for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self 
        present(controller, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBAction func IndexChange(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            let Red=UIColor(red: 255/255.0,green: 174/255.0,blue: 185/255.0,alpha: 1.0)
            view.backgroundColor=Red
            
        case 1:
            let Blue=UIColor(red: 185/255.0,green: 211/255.0,blue: 238/255.0,alpha: 1.0)
            view.backgroundColor=Blue
        case 2:
            let Green=UIColor(red: 127/255.0,green: 255/255.0,blue: 212/255.0,alpha: 1.0)
        view.backgroundColor=Green
        default:
            let White=UIColor(red: 255/255.0,green: 255/255.0,blue: 255/255.0,alpha: 1.0)
            view.backgroundColor=White
        }
    }
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var SliderLabel: UILabel!
    @IBAction func SliderValueChange(_ sender: UISlider) {
        var currentValue=Int(sender.value)
        SliderLabel.text = "\(currentValue)/5"
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var starTextField: UITextField!
    
    @IBAction func done(_ sender: Any) {
        
        print("\(nameTextField.text!) \(starTextField.text!)")
        
        if nameTextField.text!.characters.count  == 0 || starTextField.text!.characters.count == 0 {
            
            let controller = UIAlertController(title: "錯誤", message: "有欄位尚未填寫", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            
            
            present(controller, animated: true, completion: nil)
            
            
            return
        }
        
        
        
        let image = selectPhotoBut.backgroundImage(for: .normal)
        
        
        let data = UIImagePNGRepresentation(image!)
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(nameTextField.text!).png")

        
        try? data?.write(to: url!)
        
        
        
        let dic = ["name":nameTextField.text!,
                   "star":starTextField.text!,
                   "rate":SliderLabel.text!
                   //"weight":"60",
                   //"height":"180"
        ]
        
        
        
        let notiName = Notification.Name("addLover")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)

        self.navigationController?.popViewController(animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
