$(document).ready(function() {

  $('.mytable').DataTable({
    scrollY: "20em",
    scrollCollapse: true,
    paging: false,
    autoWidth: true,
    responsive: true,
    retrieve: true,
    buttons: [
      'print'
    ]
  });
  buildTable();
  // fxheaderInit('dataTable',200); a scrollable table with fixed header. No auto sort that DataTable has.
});
