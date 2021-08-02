Class {
	#name : #GeoUserCategoryStatus,
	#superclass : #Object,
	#instVars : [
		'user',
		'category',
		'status'
	],
	#category : #'Geo Schedule Domain'
}

{ #category : #testing }
GeoUserCategoryStatus >> canView [
	
	^status = 'view' or: [ status = 'admin' ]
]

{ #category : #accessing }
GeoUserCategoryStatus >> category [

	^ category
]

{ #category : #accessing }
GeoUserCategoryStatus >> category: anObject [

	category := anObject
]

{ #category : #printing }
GeoUserCategoryStatus >> printOn: aStream [

	aStream
		print: category ;
		space;
		print: user  
]

{ #category : #accessing }
GeoUserCategoryStatus >> status [

	^ status
]

{ #category : #accessing }
GeoUserCategoryStatus >> status: anObject [

	status := anObject
]

{ #category : #accessing }
GeoUserCategoryStatus >> user [

	^ user
]

{ #category : #accessing }
GeoUserCategoryStatus >> user: anObject [

	user := anObject
]
