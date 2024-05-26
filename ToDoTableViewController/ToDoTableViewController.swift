//
//  ToDoTableViewController.swift
//  ToDoTableViewController
//
//  Created by 배현빈 on 5/26/24.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list = ["장보기", "영화보기", "과제하기", "복습하기", "잠자기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        
    }
    
    
    @objc func addButtonClicked() {
        
        
        // 이건 스페이스바 여러번 치면 빈문자로 입력이 가능함
        /*
         
        if addTextField.text == "" {
            
        }
         
         if addTextField.text!.isEmpty { //얘가 조금 더 빠름!
             
         }
        */
        
        guard let text = addTextField.text, text.count > 1 else {
            print("두글자 이상 입력해주세요")
            return
        }
        
        list.append(text)
        
        addTextField.text = "" // 빈문자 처리!
        
        
        // 데이터와 뷰는 따로 놀기 때문에, 데이터가 달라지면 뷰를 다시 갱신해주어야 한다
        tableView.reloadData()
    }
    
 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count // 5 > 6
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")!
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        list.remove(at: indexPath.row)
        
        tableView.reloadData() // 데이터가 수정되었기 때문에 꼭 갱신해주어야 함!
    }
    
    
    
    
}
