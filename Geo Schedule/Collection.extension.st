Extension { #name : #Collection }

{ #category : #'*Geo Schedule' }
Collection >> partition: aBlock [ 

	"(OrderedCollection with: 1->2 with: 2->3 with: 3->4 with: 1->5) partition: #key"
	| result |
	result := Dictionary new: self size // 5.
	self do: [:each | 	| key collection |
		key := aBlock cull: each.
		collection := result at: key ifAbsentPut: [OrderedCollection new: 10].
		collection add: each].
	^result
]
