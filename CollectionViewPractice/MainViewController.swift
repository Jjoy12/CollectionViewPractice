//
//  MainViewController.swift
//  CollectionViewPractice
//
//  Created by Jerrion Joy on 12/21/20.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        
        return cv
    }()
    
    let backgroundView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "bg")
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
        
    }()
    
    let imagesCellID = "ImagesCellID"
    let albumCellID = "AlbumCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        func setupViews() {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(ImagesCell.self, forCellWithReuseIdentifier: imagesCellID)
            collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: albumCellID)
            
            view.addSubview(backgroundView)
            view.addSubview(collectionView)
            
        }
        
        func setupConstrains() {
            NSLayoutConstraint.activate([
                
                
                backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                
            ])
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 9
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellID, for: indexPath) as! ImagesCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumCellID, for: indexPath) as! AlbumCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1{
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        return CGSize(width: (view.frame.width), height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 8)
        }
        
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        
        
    }
    
    class ImagesCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .red
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    class AlbumCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .blue
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
