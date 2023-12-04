//
//  PlaceSearchViewController.swift
//  CrimsonTaxi
//
//  Created by Dzakhon on 24/10/23.
//

import UIKit

final class PlaceSearchViewController: BaseViewController {

    @IBOutlet weak var searchView: SearchFieldView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var touchPoint: CGPoint?
    var FINAL_POINT: CGFloat = safeAreaBottomHeight + 50
    var INITIAL_POINT: CGFloat = SCREEN_SIZE.height - safeAreaBottomHeight - 200
    var HIDE_POINT: CGFloat = SCREEN_SIZE.height
    
    var placeSelectAction: CommonAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureCollectionView()
        
        searchView.set(placeholder: "Where would you go?")
        searchView.set(image: UIImage(named: "loc"))
        
        searchView.beginSearchAction = { [weak self] in
            guard let self else { return }
            self.move(to: self.FINAL_POINT)
        }
        
        searchView.endSearchAction = { [weak self] in
            guard let self else { return }
            //self.move(to: self.INITIAL_POINT)
        }
        
        searchView.didTapMapAction = { [weak self] in
            guard let self else { return }
            self.move(to: self.INITIAL_POINT)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.clip(radius: 26)
        view.applyShadow(opacity: 0.3)
        view.backgroundColor = Theme.current.background
        collectionView.reloadData()
    }
    
}


extension PlaceSearchViewController {
    
    func move(to point: CGFloat) {
        UIView.animate(withDuration: DEFAULT_ANIMATION_DURATION) {
            self.view.frame.origin.y = point
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        touchPoint = touch.location(in: view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        view.frame.origin.y = touch.location(in: view.superview).y - (touchPoint?.y ?? 0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchPoint = nil
        let currentFrame = view.convert(view.bounds, from: view.superview)
        if currentFrame.origin.y.unsigned > SCREEN_SIZE.height/2 {
            move(to: self.INITIAL_POINT)
        } else {
            move(to: self.FINAL_POINT)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        touchPoint = nil
    }
    
}


extension PlaceSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 0,
                                                        bottom: 150,
                                                        trailing: 0)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(UINib(nibName: "PlaceCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "PlaceCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCollectionViewCell", for: indexPath) as? PlaceCollectionViewCell
        cell?.setData()
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        placeSelectAction?()
    }
}
