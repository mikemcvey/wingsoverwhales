<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<style>
			body {
				font-family: "Open Sans", sans-serif;
				line-height: 1.25;
			}

			table {
				border: 1px solid #ccc;
				border-collapse: collapse;
				margin: 0;
				padding: 0;
				width: 50%;
				table-layout: fixed;
			}

			table caption {
				font-size: 1.5em;
				margin: .5em 0 .75em;
			}

			table tr {
				background-color: #f8f8f8;
				border: 1px solid #ddd;
				padding: .35em;
			}

			table th,
			table td {
				padding: .625em;
				text-align: left;
			}

			table th {
				font-size: .85em;
				letter-spacing: .1em;
				text-transform: uppercase;
			}

			@media screen and (max-width: 600px) {
				table {
					border: 0;
				}

				table caption {
					font-size: 1.3em;
				}
				
				table thead {
					border: none;
					clip: rect(0 0 0 0);
					height: 1px;
					margin: -1px;
					overflow: hidden;
					padding: 0;
					position: absolute;
					width: 1px;
				}
				
				table tr {
					border-bottom: 3px solid #ddd;
					display: block;
					margin-bottom: .625em;
				}
				
				table td {
					border-bottom: 1px solid #ddd;
					display: block;
					font-size: .8em;
					text-align: right;
				}
				
				table td::before {
					content: attr(data-label);
					float: left;
					font-weight: bold;
					text-transform: uppercase;
				}
				
				table td:last-child {
					border-bottom: 0;
				}
			}
		</style>
	</head>
	<body>
		<%-- Note: content is already escaped in UserDefinedFormController::process --%>
		$Body.RAW

		<table>
		<tbody>
			<% loop $Fields %>
				<tr>
					<td><strong><% if $Title %>$Title<% else %>$Name<% end_if %></strong></td>
					<td>$FormattedValue</td>
				</tr>
			<% end_loop %>
		</tbody>
	</table>
		
	</body>
</html>