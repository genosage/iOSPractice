//
//  DetailViewCotroller.swift
//  Todo
//
//  Created by 张添 on 2/10/2015.
//  Copyright © 2015 Tian Zhang. All rights reserved.
//

import UIKit

class DetailViewCotroller: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingCartButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    
    var todo:TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoItem.delegate = self
        
        if todo == nil {
            childButton.selected = true
            navigationController?.title = "add new todo"
        }else{
            navigationController?.title = "edit todo"
            if todo?.image == "child-selected"{
                childButton.selected = true
            }else if todo?.image == "shopping-cart-selected"{
                shoppingCartButton.selected = true
            }else if todo?.image == "phone-selected"{
                phoneButton.selected = true
            }else if todo?.image == "travel-selected"{
                travelButton.selected = true
            }
            
            
            todoItem.text = todo?.title
            todoDate.setDate(todo!.date, animated: false)
        }

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        todoItem.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButtons(){
        childButton.selected = false
        phoneButton.selected = false
        shoppingCartButton.selected = false
        travelButton.selected = false
    }
    
    @IBAction func childTapped(sender: AnyObject) {
        resetButtons()
        childButton.selected = true
    }

    @IBAction func phoneTapped(sender: AnyObject) {
        resetButtons()
        phoneButton.selected = true
    }
    
    @IBAction func shoppingCartTapped(sender: AnyObject) {
        resetButtons()
        shoppingCartButton.selected = true
    }
    
    @IBAction func travelTapped(sender: AnyObject) {
        resetButtons()
        travelButton.selected = true
    }
    
    @IBAction func okTapped(sender: AnyObject) {
        var image = ""
        
        if childButton.selected == true {
            image = "child-selected"
        }
        
        else if phoneButton.selected == true {
            image = "phone-selected"
        }
        
        else if shoppingCartButton.selected == true {
            image = "shopping-cart-selected"
        }
        
        else if travelButton.selected == true {
            image = "travel-selected"
        }
        
        if todo == nil {
        let uuid = NSUUID().UUIDString
        var todo = TodoModel(id: uuid, image: image, title: todoItem.text!, date: todoDate.date)
        todos.append(todo)
        }
        else{
            todo?.image = image
            todo?.title = todoItem.text!
            todo?.date = todoDate.date
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
