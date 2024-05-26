//
//  SearchTableViewController.swift
//  ToDoTableViewController
//
//  Created by 배현빈 on 5/26/24.
//

import UIKit

struct Travel {
    let country: String
    let money: Int
    var like: Bool
}


class SearchTableViewController: UITableViewController {
    
    var list = [
        Travel(country: "프랑스", money: 100300500, like: false),
        Travel(country: "일본", money: 12345, like: false),
        Travel(country: "영국", money: 4614852, like: true),
        Travel(country: "네덜란드", money: 34234, like: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print ("======")
        
        // Swift Type Casting
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as!
        SearchTableViewCell
        let data = list[indexPath.row]
        
        cell.titleLabel.text = data.country
        cell.titleLabel.font = .boldSystemFont(ofSize: 30)
        
        cell.subtitleLabel.text = list[indexPath.row].money.formatted()
        // cell.subtitleLabel.text = data.money.formatted()
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .darkGray
        
        
        cell.posterImageView.layer.cornerRadius = 10
        cell.posterImageView.backgroundColor = .lightGray
        
        
        // 삼항연산자로 표현
        let name = list[indexPath.row].like ? "heart.fill" : "heart"
        let image = UIImage(systemName: name)
        cell.likeButton.setImage(image, for: .normal)
        
        cell.likeButton.tag = indexPath.row
        
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func likeButtonClicked (sender: UIButton) {
        // 어떤 버튼을 클릭해도 프랑스가 true 로
        
        /*
        if list[0].like {
            list[0].like = false
        } else {
            list[0].like = true
        }
         */
        
        
        
        list[sender.tag].like.toggle()   // 기냐 아니냐!
    //  list[0].like = !list[0].like
        
       // tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        
     // print(list[0])
        print(sender.tag)
    }
}
    
    /*
     if list[indexPath.row].like {
     let image = UIImage(systemName: "heart.fill")
     cell.likeButton.setImage(image, for: .normal)
     
     } else {
     let image = UIImage(systemName: "heart")
     cell.likeButton.setImage(image, for: .normal)
     }
     */
    
   


   
   
