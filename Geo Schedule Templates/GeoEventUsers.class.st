Class {
	#name : #GeoEventUsers,
	#superclass : #Object,
	#instVars : [
		'event',
		'userStatus',
		'template'
	],
	#category : #'Geo Schedule Templates'
}

{ #category : #comparing }
GeoEventUsers >> <= anEventUsers [

	^event dateAndTime <= anEventUsers event dateAndTime
]

{ #category : #accessing }
GeoEventUsers >> event [

	^ event
]

{ #category : #accessing }
GeoEventUsers >> event: anObject [

	event := anObject
]

{ #category : #printing }
GeoEventUsers >> printOn: aStream [

	aStream print: event
]

{ #category : #accessing }
GeoEventUsers >> resetUserStatus [

	userStatus := nil
]

{ #category : #accessing }
GeoEventUsers >> template [

	^ template
]

{ #category : #accessing }
GeoEventUsers >> template: anObject [

	template := anObject
]

{ #category : #accessing }
GeoEventUsers >> userStatus [

	userStatus ifNil: [ 
		userStatus := template users collect: [ :user | 
			              GeoUserStatus new
				              user: user;
				              status: (event statusForUser: user);
				              yourself ] ].
	^ userStatus
]
