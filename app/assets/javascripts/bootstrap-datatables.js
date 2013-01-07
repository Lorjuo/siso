$(document).ready(function() {
	//alert('test');
	//
	// For fluid containers
	// $('.datatable').dataTable({
	//   "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	//   "sPaginationType": "bootstrap"

	// });

	// For fixed width containers
	// $('.datatable').dataTable({
	//   "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
	//   "sPaginationType": "bootstrap"
	// });
	
	$('.datatable').dataTable({
	  "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	  "sPaginationType": "bootstrap",
    "bJQueryUI": false,
    "bProcessing": true,
    "bServerSide": true,
    "sAjaxSource": $('.datatable').data('source')
	});

	$.extend( $.fn.dataTableExt.oStdClasses, {
		"sSortAsc": "header headerSortDown",
		"sSortDesc": "header headerSortUp",
		"sSortable": "header"
	} );
} );
