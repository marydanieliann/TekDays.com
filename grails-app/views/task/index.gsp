

<%@ page import="com.tekdays.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript>
		$(document).ready(function() {
			$('#dt').DataTable({
				sScrollY: "75%",
				sScrollX: "100%",
				bProcessing: true,
				bServerSide: true,
				sAjaxSource: "/TekDays.com/task/dataTablesRenderer",
				bJQueryUI: false,
				bAutoWidth: false,
				sPaginationType: "full_numbers",
				aLengthMenu: [5,10,25,50,100,200],
				iDisplayLength: 10,
				aoColumnDefs: [
                    {
                        render: function (data, type, full, meta) {
                            if (full[4]) {
                                return '<a href="${createLink(controller: 'Task', action: 'show')}/' + full[4] + '"class="btn">' + data + '</a>';
                            } else {
                                return data;
                            }
                        },
                        aTargets: [0],
                        visible: true,
                        bSearchable: true,
                        bSortable: true
                    },
                    {
                        createdCell: function (td, cellData, rowData, row, col) {
                            $(td).attr('style', 'color: #423F3FFF');
                        },
                        aTargets: [1, 2],
                        bSearchable: false,
                        bSortable: false,
                        visible: true
                    },
                    {
					createdCell: function ( td, cellData, rowData, row, col) {
						$(td).attr('style','text-align: left;');
					},
					render: function ( data, type, full, meta ) {
						if (data) {
							return '<a href="task/edit/' + data + '" class="btn"> <i class="fas fa-edit" > Edit </i> </a>';
						} else {
							return "";
						}
					},
					aTargets: 3,
					bSortable: false
				},
					{
						createdCell: function (td, cellData, rowData, row, col) {
							$(td).attr('style', 'text-align: left;');
						},
						render: function (data, type, full, meta) {
							if (data) {
								return '<a href="" class="btn">Delete</a>';
							} else {
								return "";
							}
						},
						aTargets: 4,
						bSortable: false,
						}
				]
			});
		});
		</g:javascript>
	</head>
	<body>
		<a href="#list-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

	<table class="display compact" id="dt">
		<thead>
		<tr>
			<th><g:message code="default.button.Title.label" default="Title"/></th>
			<th><g:message code="default.button.AssignedTo.label" default="Assigned To"/></th>
			<th><g:message code="default.button.DueDate.label" default="Due Date"/></th>
			<th><g:message code="default.button.Edit.label" default="Edit"/></th>
			<th><g:message code="default.button.Delete.label" default="Delete"/></th>
		</tr>
		</thead>
		<tbody></tbody>
		<tfoot>
		<tr>
			<th><g:message code="default.button.Title.label" default="Title"/></th>
			<th><g:message code="default.button.AssignedTo.label" default="Assigned To"/></th>
			<th><g:message code="default.button.DueDate.label" default="Due Date"/></th>
			<th><g:message code="default.button.Edit.label" default="Edit"/></th>
			<th><g:message code="default.button.Delete.label" default="Delete"/></th>
		</tr>
		</tfoot>
	</table>
	</body>
</html>

