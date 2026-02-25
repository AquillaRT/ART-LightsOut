"
I am a simple 2D container that stores elements in a grid structure.
While Pharo provides Array2D in the Collections-Arithmetic package, I serve as a lightweight, zero-dependency alternative using a 1D Array internally.

Responsibility:
- Map 2D coordinates (row, column) to a 1D storage index.
- Provide basic accessors for grid-based data.

Example:
    | grid |
    grid := MyGrid rows: 5 columns: 5.
    grid at: 1 at: 1 put: 'Yellow'.
    grid at: 1 at: 1. ""-> 'Yellow'""

Internal Representation and Key Implementation Points:
- contents: <Array> stores the actual elements.
- rows: <Integer> number of rows.
- columns: <Integer> number of columns.
The mapping formula is: (row - 1) * columns + column.
"
Class {
	#name : 'ManifestARTMyExtentions',
	#superclass : 'PackageManifest',
	#category : 'ART-MyExtentions-Manifest',
	#package : 'ART-MyExtentions',
	#tag : 'Manifest'
}
