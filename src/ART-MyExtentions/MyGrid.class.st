Class {
	#name : 'MyGrid',
	#superclass : 'Object',
	#instVars : [
		'contents',
		'rows',
		'columns'
	],
	#category : 'ART-MyExtentions-Grids',
	#package : 'ART-MyExtentions',
	#tag : 'Grids'
}

{ #category : 'instance creation' }
MyGrid class >> rows: r columns: c [
	"Initializer for a custom class (MyGrid) instead of Array2D"

	^ self new setRows: r columns: c
]

{ #category : 'enumerating' }
MyGrid >> allSatisfy: aBlock [
	"すべての要素が aBlock の条件を満たす場合に true を返します"

	^ contents allSatisfy: aBlock
]

{ #category : 'accessing' }
MyGrid >> at: r at: c [

	^ contents at: ((r - 1) * columns + c)
]

{ #category : 'accessing' }
MyGrid >> at: r at: c ifPresent: aBlock [
	"If the specified coordinates are within the range, 
		execute aBlock with that element as an argument."

	((r between: 1 and: rows) and: [ c between: 1 and: columns ])
		ifTrue: [ aBlock value: (self at: r at: c) ]
]

{ #category : 'accessing' }
MyGrid >> at: r at: c put: anObject [

	contents at: ((r - 1) * columns + c) put: anObject
]

{ #category : 'enumerating' }
MyGrid >> do: aBlock [
	"保持しているすべての要素に対して aBlock を実行します"

	contents do: [ :each | aBlock value: each ]
]

{ #category : 'testing' }
MyGrid >> includesRow: r column: c [
	"Checks whether the specified coordinates are within the bounds of the MyGrid instance."

	^ (r between: 1 and: rows) and: [ c between: 1 and: columns ]
]

{ #category : 'enumerating' }
MyGrid >> indicesDo: aBlock [
	"各要素の行番号と列番号を引数として aBlock を実行します"

	1 to: rows do: [ :r | 
		1 to: columns do: [ :c | 
			aBlock value: r value: c ] ]
]

{ #category : 'initialization' }
MyGrid >> setRows: r columns: c [

	rows := r.
	columns := c.
	contents := Array new: r * c
]
