<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'tekEvent.label', default: 'TekEvent')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<g:javascript>
		$(document).ready(function() {
			var table = $('#dt').DataTable({
				sScrollY: "75%",
				sScrollX: "100%",
				bProcessing: true,
				bServerSide: true,
				sAjaxSource: "/TekDays.com/tekEvent/dataTablesRenderer",
				bJQueryUI: false,
				bAutoWidth: false,
				sPaginationType: "full_numbers",
				aLengthMenu: [5],
				"oLanguage": {
					 "sInfoFiltered": ""
				   },
				iDisplayLength: 5,
				aoColumnDefs: [
                    {
                        render: function (data, type, full, meta) {
                            if (full[4]) {
								return '<a href="${createLink(controller: 'TekEvent', action: 'show')}/' + full[4] + '" class="btn">' + data + '</a>';
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
                            console.log(4585);
                            %{--                            return '<a href="${createLink(controller: 'TekEvent', action: 'edit')}/' + data + '" class="btn"> </a>';--}%
							return '<a href="tekEvent/edit/' + data + '" class="edit_btn"> <i class="fas fa-edit" > Edit </i> </a>';
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
								return '<button id="' + data + '" class="delete_btn" onclick="confirmDelete(\'' + data + '\')">Delete</button>';
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
	function confirmDelete(id) {
						var confirmation = confirm("Are you sure you want to delete this TekEvent?");
						if (confirmation) {
							$.ajax({
								type: "POST",
								url: "/TekDays.com/tekEvent/deleted",
								data: {
									id: id
								},
								success: function(result) {
									if (result.message) {
									$('#dt').DataTable().ajax.reload();
									  //  location.reload();
									} else {
										alert(result.message);
									}
								},
								error: function(xhr, status, error) {
									console.log(error);
								}
							});
						} else {
							// User clicked "Cancel", do nothing
						}
					}

                    </g:javascript>
</head>
<body>
<a href="#list-tekEvent" class="skip" tabindex="-1"><g:message
		code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="create" action="create">
			<g:message code="default.new.label" args="[entityName]" />
		</g:link></li>
	</ul>
</div>
<table class="display compact" id="dt">
	<thead>
	<tr>
		<th><g:message code="default.button.Name.label" default="Name"/></th>
		<th><g:message code="default.button.City.label" default="City"/></th>
		<th><g:message code="default.button.Description.label" default="Description"/></th>
		<th><g:message code="default.button.Edit.label" default="Edit"/></th>
		<th><g:message code="default.button.Delete.label" default="Delete"/></th>
	</tr>
	</thead>
	<tbody></tbody>
	<tfoot>
	<tr>
		<th><g:message code="default.button.Name.label" default="Name"/></th>
		<th><g:message code="default.button.City.label" default="City"/></th>
		<th><g:message code="default.button.Description.label" default="Description"/></th>
		<th><g:message code="default.button.Edit.label" default="Edit"/></th>
		<th><g:message code="default.button.Delete.label" default="Delete"/></th>
	</tr>
	</tfoot>
</table>
</body>
</html>

