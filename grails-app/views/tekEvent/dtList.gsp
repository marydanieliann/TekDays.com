<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'tekEvent.label', default: 'TekEvent')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <g:javascript library="jquery"/>
    <g:javascript>
        $(document).ready(function() {
            $('#dt').DataTable({
                sScrollY: "75%",
                sScrollX: "100%",
                bProcessing: true,
                bServerSide: true,
                sAjaxSource: "/TekDays.com/tekEvent/dataTablesRenderer",
                bJQueryUI: false,
                bAutoWidth: false,
                sPaginationType: "full_numbers",
                aLengthMenu: [[10, 25, 50, 100, 200], [10, 25, 50, 100, 200]],
                iDisplayLength: 10,
                aoColumnDefs: [{
                    createdCell: function ( td, cellData, rowData, row, col) {
                        $(td).attr('style','text-align: center;');
                    },
                    render: function ( data, type, full, meta ) {
                        if (data) {
                            return '<a href="edit/' + data + '" class="btn">Edit</a>';
                        } else {
                            return "";
                        }
                    },
                }]
            });
        });
    </g:javascript>
</head>
<body>
<table class="display compact" id="dt">
    <thead>
    <tr>
        <th>Name</th>
        <th>City</th>
        <th>Organizer</th>
        <th>Edit</th>
    </tr>
    </thead>
    <tbody></tbody>
    <tfoot>
    <tr>
        <th>Name</th>
        <th>City</th>
        <th>Organizer</th>
        <th>Edit</th>
    </tr>
    </tfoot>
</table>
</body>
</html>