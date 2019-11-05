//
//  ViewController.swift
//  Test chat
//
//  Created by Roman Filippov on 05.11.2019.
//  Copyright © 2019 Filippov. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    private var inputBotomConstraint: NSLayoutConstraint!
    
    private(set) lazy var tableView: UITableView = { [unowned self] in
        let tv = UITableView()
        tv.keyboardDismissMode = .interactive
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tv
    }()
    
    private let messageInputView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let messageTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.enablesReturnKeyAutomatically = true
        field.borderStyle = .roundedRect
        return field
    }()
    
    override var inputAccessoryView: UIView? {
        return messageInputView
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scrollView frame must be equal with viewController view frame
        view = tableView
        
        view.backgroundColor = .white
        
        view.addSubview(messageInputView)
        NSLayoutConstraint.activate([
            messageInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageInputView.widthAnchor.constraint(equalTo: view.widthAnchor),
            messageInputView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            messageInputView.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        messageInputView.addSubview(messageTextField)
        NSLayoutConstraint.activate([
            messageTextField.leadingAnchor.constraint(equalTo: messageInputView.leadingAnchor, constant: 20),
            messageTextField.trailingAnchor.constraint(equalTo: messageInputView.trailingAnchor, constant: -20),
            messageTextField.bottomAnchor.constraint(equalTo: messageInputView.bottomAnchor, constant: -8),
            messageTextField.topAnchor.constraint(equalTo: messageInputView.topAnchor, constant: 8)
        ])
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.contentView.backgroundColor = UIColor(hue: CGFloat(indexPath.row % 100) / 100, saturation: 0.5, brightness: 0.9, alpha: 1)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}
