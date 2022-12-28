export class SortedTable {
  constructor(table_id, column_name) {
    this.table = document.getElementById(table_id)
    this.selectedNode = this.table.querySelector(".sort-by-" + CSS.escape(column_name))
    this.rows = this.table.querySelectorAll('tr')
    this.sortedRows = []
    this.sortedTable = document.createElement('table')
    this.arrowUp = this.selectedNode.querySelector('.octicon-arrow-up')
    this.arrowDown = this.selectedNode.querySelector('.octicon-arrow-down')
    this.column_name = column_name
  }

  setup() {
    const control = document.querySelector(".sort-by-" + CSS.escape(this.column_name))

    if (control) control.addEventListener('click', event => {
      this.sortRowsByColumnName()
    })
  }

  sortRowsByColumnName() {
    const ColumnPos = this.selectedNode.cellIndex

    for (let i = 1; i < this.rows.length; i++) {
      this.sortedRows.push(this.rows[i])
    }

    if (this.arrowUp.classList.contains('hide')) {
      this.sortedRows.sort((rowA, rowB) => rowA.cells[ColumnPos].innerHTML > rowB.cells[ColumnPos].innerHTML ? 1 : -1)
      this.arrowUp.classList.remove('hide')
      this.arrowDown.classList.add('hide')
    } else {
      this.sortedRows.sort((rowA, rowB) => rowA.cells[ColumnPos].innerHTML > rowB.cells[ColumnPos].innerHTML ? -1 : 1)
      this.arrowDown.classList.remove('hide')
      this.arrowUp.classList.add('hide')
    }

    this.createSortedTable()
  }

  createSortedTable() {
    this.sortedTable.classList.add('table', 'table-bordered')
    this.sortedTable.appendChild(this.rows[0])

    for (let i = 0; i < this.sortedRows.length; i++) {
      this.sortedTable.appendChild(this.sortedRows[i])
    }

    if (this.table.parentNode) this.table.parentNode.replaceChild(this.sortedTable, this.table)
  }
}
