import Blueprints
import UIKit

class MockDelegate: NSObject, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = indexPath.item % 2 == 1 ? 200 : 275
    return CGSize(width: 200, height: height)
  }
}

class Helper {
  static func createHorizontalLayout(dataSource: UICollectionViewDataSource) -> (collectionView: CollectionView, layout: HorizontalBlueprintLayout) {
    let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
    let layout = HorizontalBlueprintLayout(
      minimumInteritemSpacing: 10,
      minimumLineSpacing: 10,
      sectionInset: EdgeInsets(top: 10, left: 50, bottom: 10, right: 50))
    layout.itemSize = CGSize(width: 50, height: 50)
    layout.estimatedItemSize = CGSize(width: 50, height: 50)
    let collectionView = CollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.dataSource = dataSource

    return (collectionView: collectionView, layout: layout)
  }

  static func createVerticalLayout(dataSource: UICollectionViewDataSource) -> (collectionView: CollectionView, layout: VerticalBlueprintLayout) {
    let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))

    let layout = VerticalBlueprintLayout(
      minimumInteritemSpacing: 10,
      minimumLineSpacing: 10,
      sectionInset: EdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    layout.itemSize = CGSize(width: 50, height: 50)
    layout.estimatedItemSize = CGSize(width: 50, height: 50)
    let collectionView = CollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.dataSource = dataSource

    return (collectionView: collectionView, layout: layout)
  }

  static func createAnimator(dataSource: UICollectionViewDataSource) -> DefaultLayoutAnimator {
    let frame = CGRect(origin: .zero, size: .init(width: 200, height: 200))
    let animator = DefaultLayoutAnimator()
    let layout = BlueprintLayout(animator: animator)
    animator.CollectionViewFlowLayout = layout
    let collectionView = CollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.dataSource = dataSource
    layout.prepare()

    return animator
  }

  static func createVerticalMosaicLayout(dataSource: UICollectionViewDataSource) -> (collectionView: CollectionView, layout: VerticalMosaicBlueprintLayout) {
    let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
    let patterns = [
      MosaicPattern(alignment: .left, direction: .vertical, amount: 2, multiplier: 0.5),
      MosaicPattern(alignment: .left, direction: .horizontal, amount: 2, multiplier: 0.5),
      MosaicPattern(alignment: .right, direction: .vertical, amount: 2, multiplier: 0.5)
    ]

    let layout = VerticalMosaicBlueprintLayout(
      minimumInteritemSpacing: 2,
      minimumLineSpacing: 2,
      sectionInset: EdgeInsets(top: 2, left: 2, bottom: 2, right: 2),
      patterns: patterns)
    layout.itemSize = CGSize(width: 50, height: 50)
    layout.estimatedItemSize = CGSize(width: 50, height: 50)
    let collectionView = CollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.dataSource = dataSource

    return (collectionView: collectionView, layout: layout)
  }

  static func createVerticalWaterfallLayout(dataSource: UICollectionViewDataSource) -> (collectionView: CollectionView, layout: VerticalWaterfallBlueprintLayout) {
    let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))

    let layout = VerticalWaterfallBlueprintLayout(
      itemsPerRow: 2,
      minimumInteritemSpacing: 2,
      minimumLineSpacing: 2,
      sectionInset: EdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
    layout.itemSize = CGSize(width: 50, height: 50)
    layout.estimatedItemSize = CGSize(width: 50, height: 50)
    let collectionView = CollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.dataSource = dataSource

    return (collectionView: collectionView, layout: layout)
  }
}
