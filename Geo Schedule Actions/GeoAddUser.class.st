Class {
	#name : #GeoAddUser,
	#superclass : #GeoAction,
	#category : #'Geo Schedule Actions'
}

{ #category : #actions }
GeoAddUser >> addTo: aSchedule [

	| user |
	payload at: 'id' put: aSchedule nextId.
	user := GeoUser new.
	user
		id: (payload at: 'id').
	payload at: 'name' ifPresent: [ :name | user name: name ].
	payload at: 'surname' ifPresent: [ :surname | user surname: surname ].
	payload at: 'email' ifPresent: [ :email | user email: email ].
	payload at: 'phone' ifPresent: [ :phone | user phone: phone ].
	payload at: 'password' ifPresent: [ :password | user password: password ].
	payload at: 'role' ifPresent: [ :role | user role: role ] ifAbsent: [user role: 'normal'].
	payload at: 'websiteRole' ifPresent: [ :websiteRole | user websiteRole: websiteRole ] ifAbsent: [user websiteRole: 'normal'].
	aSchedule users at: user id put: user.
	^user
]
