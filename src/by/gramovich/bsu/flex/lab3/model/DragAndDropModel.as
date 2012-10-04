package by.gramovich.bsu.flex.lab3.model
{
	import mx.collections.ArrayCollection;
	import mx.controls.dataGridClasses.DataGridColumn;

	/**
	 * Model for application
	 */
	[Bindable]
	public class DragAndDropModel
	{
		private static var instance : DragAndDropModel;
		
		public var firstGridData: ArrayCollection;
		
		
		/**
		 * Collection of data for DatatGrids
		 */
		public var dataGrid: ArrayCollection = new ArrayCollection ([
			{"#":"1", Title:"First", "Reference ID":"1", "Document ID":"F-1", Link:"first.com"},
			{"#":"2", Title:"Second", "Reference ID":"2", "Document ID":"S-2", Link:"second.com"},
			{"#":"3", Title:"Third", "Reference ID":"3", "Document ID":"S-3", Link:"third.com"},
			{"#":"4", Title:"Fourth", "Reference ID":"4", "Document ID":"F-4", Link:"fourth.com"},
			{"#":"5", Title:"Fifth", "Reference ID":"5", "Document ID":"F-5", Link:"fifth.com"}
			]);
		
		/**
		 * Collection of data for List
		 */
		public var dataList: ArrayCollection = new ArrayCollection([
			{Index: 1, Visible: true, Checked: false, Sorted: false, SortedAsc: false, Title: "Title", src: "asc.png", visible: false},
			{Index: 2, Visible: true, Checked: false, Sorted: false, SortedAsc: false, Title: "Reference ID", src: "asc.png", visible: false},
			{Index: 3, Visible: true, Checked: false, Sorted: false, SortedAsc: false, Title: "Document ID", src: "asc.png", visible: false},
			{Index: 4, Visible: true, Checked: false, Sorted: false, SortedAsc: false, Title: "Link", src: "asc.png", visible: false}
		]);
		
		public var selectedIndex:int;
		public var previousSelection:int;
		
		public var visibility:Array = [false, false, false, false, false];
		public var visible1:Boolean = false;
		public var visible2:Boolean = false;
		public var visible3:Boolean = false;
		public var visible4:Boolean = false;
		
		public function DragAndDropModel(){}
		
		public static function getInstance() : DragAndDropModel {
			if (instance == null) {
				instance = new DragAndDropModel();
			}
			return instance;
		}
	}
}