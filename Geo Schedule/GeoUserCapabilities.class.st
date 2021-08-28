Class {
	#name : #GeoUserCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #accessing }
GeoUserCapabilities >> categories [

	^ ((user categoryStatus select: [ :catStat | catStat canView ]) 
		   collect: [ :catStat | self categoryObjectFor: catStat category ]) 
		  asSortedCollection: [ :a :b | a <= b ]
]

{ #category : #accessing }
GeoUserCapabilities >> categoryObjectFor: category [

	| statusPermissions |
	statusPermissions := (user isAdminFor: category)
		                     ifTrue: [ 
			                     GeoJSONObject new
				                     event: #( 'open' 'closed' 'finished' 'archived' );
				                     user:  #( 'confirmedScheduling' 'iCan' 'iCanNot' 'neutral' 'scheduled' );
				                     yourself ]
		                     ifFalse: [ 
			                     GeoJSONObject new
				                     event: #(  );
				                     user: #( 'iCan' 'iCanNot' 'neutral' );
				                     yourself ].


	^ GeoJSONObject new
		  id: category id;
		  name: category name;
		  description: category description;
		  statusPermissions: statusPermissions;
		  yourself
]

{ #category : #accessing }
GeoUserCapabilities >> eventObjectFor: event [

	^ self newJSONObject
		  id: event id;
		  dateAndTime: event dateAndTimeString;
		  status: event status;
		  description: event description;
		  category: event category id;
		  nrOfUsers: event nrOfUsers;
		  location: event location;
		  userStatus:
			  ((event userStatus asOrderedCollection select: [ :us | 
					    us user canViewCategory: event category ]) collect: [ :each | 
					   self newJSONObject
						   user: each user id;
						   status: each status;
						   yourself ]);
		  yourself
]

{ #category : #accessing }
GeoUserCapabilities >> events [

	| events |
	events := schedule events asOrderedCollection select: [ :event | 
		          user canViewEvent: event ].

	^ events collect: [ :event | self eventObjectFor: event ]
]

{ #category : #accessing }
GeoUserCapabilities >> userObjectFor: aUser [

	
	^ self newJSONObject
		  id: aUser id;
		  name: aUser name;
		  surname: aUser surname;
		  categoryStatus:
			  ((aUser categoryStatus asOrderedCollection select: [ :catStat | 
					    user canViewCategory: catStat category ]) collect: [ :each | 
					   self newJSONObject
						   category: each category id;
						   status: each status;
						   yourself ]);
		  yourself
]

{ #category : #accessing }
GeoUserCapabilities >> users [

	| users |
	users := (schedule users asOrderedCollection select: [ :each | 
		          user canViewUser: each ]) asSortedCollection: [ 
		         :userA 
		         :userB | userA name <= userB name ].

	^ users collect: [ :each | self userObjectFor: each ]
]
