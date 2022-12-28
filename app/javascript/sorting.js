import { SortedTable } from './utilities/sorted_table.js'

document.addEventListener('turbolinks:load', function () {
  const table_id = "test_table"
  const column_name = "title"
  const table = document.getElementById(table_id)

  if (table_id != "" && column_name != "" && table != null) new SortedTable(table_id, column_name).setup()

})
