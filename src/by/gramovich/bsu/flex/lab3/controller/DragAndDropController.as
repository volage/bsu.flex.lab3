package by.gramovich.bsu.flex.lab3.controller
{
	import by.gramovich.bsu.flex.lab3.model.DragAndDropModel;
	
	import flash.events.MouseEvent;
	
	import mx.controls.CheckBox;
	import mx.core.Application;
	import mx.events.DataGridEvent;
	import mx.events.ItemClickEvent;
	
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
			sortEvent.columnIndex = model.dataList.getItemIndex(event.currentTarget.selectedValue) + 1;
			model.previousSelection = model.selectedIndex;
			model.selectedIndex = sortEvent.columnIndex;
			model["visible"+model.selectedIndex] = true;
			model["visible"+model.previousSelection] = false;
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
				sortEvent.columnIndex = (int)(img.automationName);
				Application.application.firstDataGrid.columns[img.automationName].sortDescending = 
					!Application.application.firstDataGrid.columns[img.automationName].sortDescending;
				Application.application.firstDataGrid.dispatchEvent(sortEvent);
				
				img.source = Application.application.firstDataGrid.columns[img.automationName].sortDescending ? "desc.png" : "asc.png";
			}
		}
		
		public function setImage(index:int, desc:Boolean) {
			model.dataList[index]["src"] = desc ? "desc.png" : "asc.png";
		}
		public function OnHeaderRelease(event:DataGridEvent):void {	
			
		}
	}
}