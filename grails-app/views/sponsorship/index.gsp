
<%@ page import="com.tekdays.Sponsorship" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sponsorship.label', default: 'Sponsorship')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript>
		$(document).ready(function() {
			$('#dt').DataTable({
				sScrollY: "75%",
				sScrollX: "100%",
				bProcessing: true,
				bServerSide: true,
				sAjaxSource: "/TekDays.com/sponsorship/dataTablesRenderer",
				bJQueryUI: false,
				bAutoWidth: false,
				sPaginationType: "full_numbers",
				aLengthMenu: [5,10,25,50,100,200],
				iDisplayLength: 10,
				aoColumnDefs: [
                    {
                        render: function (data, type, full, meta) {
                            if (full[4]) {
                                return '<a href="${createLink(controller: 'Sponsorship', action: 'show')}/' + full[4] + '"class="btn">' + data + '</a>';
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
							return '<a href="edit/' + data + '" class="btn"> <i class="fas fa-edit" > Edit </i> </a>';
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
		<a href="#list-sponsorship" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

	<table class="display compact" id="dt">
		<thead>
		<tr>
			<th>Event</th>
			<th>Sponsor</th>
			<th>Contribution Type</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		</thead>
		<tbody></tbody>
		<tfoot>
		<tr>
			<th>Event</th>
			<th>Sponsor</th>
			<th>Contribution Type</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		</tfoot>
	</table>
	</body>
</html>
