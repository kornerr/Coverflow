
import UIKit

class CoverFlowSectionsView:
    UIView,
    UICollectionViewDataSource
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.setupCollectionView()
    }

    // MARK: - ITEMS

    var items: [SectionsItem]
    {
        get
        {
            return _items
        }
        set
        {
            _items = newValue
            self.updateItems()
        }
    }
    private var _items = [SectionsItem]()

    private func updateItems()
    {
        // TODO REMOVE or UPDATE
        // Provide item sizes to layout.
        /*
        let defaultSize = CGSize(width: 100, height: 100)
        let sizes = self.items.map { $0.image?.size ?? defaultSize }
        self.layout.itemSizes = sizes
        */
        // Display items.
        self.collectionView.reloadData()
    }

    // MARK: - COLLECTION VIEW

    @IBOutlet private var collectionView: UICollectionView!
    private var collectionViewLayout: CCoverflowCollectionViewLayout!

    private func setupCollectionView()
    {
        self.collectionView.register(Cell.self, forCellWithReuseIdentifier: CellId)
        self.collectionView.dataSource = self

        self.collectionViewLayout = CCoverflowCollectionViewLayout()
        self.collectionView.collectionViewLayout = self.collectionViewLayout
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return self.items.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return self.cell(forItemAt: indexPath)
    }

    // MARK: - CELL

    private let CellId = "CellId"
    private typealias CellView = CoverFlowSectionsItemView
    private typealias Cell = CBetterCollectionViewCellTemplate<CellView>

    private func cell(forItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell =
            self.collectionView.dequeueReusableCell(
                withReuseIdentifier: CellId,
                for: indexPath
            )
            as! Cell
        let item = self.items[indexPath.row]
        cell.itemView.image = item.image
        return cell
    }

}

