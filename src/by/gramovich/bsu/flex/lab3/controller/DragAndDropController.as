package by.gramovich.bsu.flex.lab3.controller
{
	import by.gramovich.bsu.flex.lab3.model.DragAndDropModel;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.controls.CheckBox;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.events.DataGridEvent;
	import mx.events.IndexChangedEvent;
	import mx.events.ItemClickEvent;
	import mx.rpc.events.HeaderEvent;
	
	import spark.components.CheckBox;

	/**
	 * Controller for application
	 */
	public class DragAndDropController
	{
		public var model:DragAndDropModel = DragAndDropModel.getInstance();
		
		public function DragAndDropController() {}
		
		/**
		 * Sort column on radio button click
		 */
		public function onRadioButtoClick(event:ItemClickEvent):void
		{
			var sortEvent: DataGridEvent = new DataGridEvent(DataGridEvent.HEADER_RELEASE); 
			sortEvent.columnIndex = model.dataList.getItemIndex(event.item) + 1;
			
			Application.application.firstDataGrid.dispatchEvent(sortEvent); 
		}
		
		public function onCheckButtonClick(event:MouseEvent):void
		{
			if (event.target.selected) {
				Application.application.firstDataGrid.columns[(int)(event.target.automationName)].visible = false; 
			} else {
				Application.application.firstDataGrid.columns[(int)(event.target.automationName)].visible = true;
			}
		}
		
		public function onImageClick(img):void
		{
			if (model.selectedIndex == img.automationName) {
				var sortEvent: DataGridEvent = new DataGridEvent(DataGridEvent.HEADER_RELEASE);
				sortEvent.columnIndex = (img.automationName);
				Application.application.firstDataGrid.columns[img.automationName].sortDescending = 
					!Application.application.firstDataGrid.columns[img.automationName].sortDescending;
				Application.application.firstDataGrid.dispatchEvent(sortEvent);
				
				img.source = Application.application.firstDataGrid.columns[img.automationName].sortDescending ? "desc.png" : "asc.png";
			}
		}
		public function OnHeaderRelease(event:DataGridEvent):void {	
			model.previousSelection = model.selectedIndex;
			model.selectedIndex = event.columnIndex;
			Application.application.radioButtonGroup.getRadioButtonAt(model.selectedIndex).selected = true;
			
		}
		
		public function onHeaderShift(event:IndexChangedEvent) {
			
			var item:Object = model.dataList.removeItemAt(event.oldIndex - 1);
			if (event.newIndex == model.dataList.length) {
				model.dataList.addItem(item);
			} else {
				model.dataList.addItemAt(item, event.newIndex - 1);
			}
			
			var sortEvent: DataGridEvent = new DataGridEvent(DataGridEvent.HEADER_RELEASE); 
			sortEvent.columnIndex = event.newIndex;
			
			Application.application.firstDataGrid.dispatchEvent(sortEvent); 

		}
	}
}