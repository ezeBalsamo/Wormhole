Class {
	#name : #BaselineOfWormhole,
	#superclass : #BaselineOf,
	#category : #BaselineOfWormhole
}

{ #category : #baselines }
BaselineOfWormhole >> baseline: spec [

	<baseline>
	spec for: #pharo do: [ 
		self
			setUpDependenciesIn: spec;
			setUpPackagesIn: spec;
			setUpGroupsIn: spec
		]
]

{ #category : #accessing }
BaselineOfWormhole >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfWormhole >> setUpDependenciesIn: spec [

	spec
		baseline: 'Kepler' with: [ spec repository: 'github://ba-st/Kepler:v5.1.0' ];
		project: 'Kepler-Notifications' copyFrom: 'Kepler' with: [ spec loads: 'Kepler-Notifications' ];
		project: 'Kepler-SUnit' copyFrom: 'Kepler' with: [ spec loads: 'Dependent-SUnit-Extensions' ].

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6' ];
		project: 'Buoy-Tools' copyFrom: 'Buoy' with: [ spec loads: 'Tools' ]
]

{ #category : #baselines }
BaselineOfWormhole >> setUpGroupsIn: spec [

	spec
		group: 'Deployment' with: 'Wormhole';
		group: 'Tests' with: 'Wormhole-Tests';
		group: 'Tools' with: 'Buoy-Tools';
		group: 'Dependent-SUnit-Extensions' with: 'Kepler-SUnit';
		group: 'CI' with: 'Tests';
		group: 'Development' with: #( 'Tests' 'Tools' )
]

{ #category : #baselines }
BaselineOfWormhole >> setUpPackagesIn: spec [

	spec
		package: 'Wormhole' with: [ spec requires: 'Kepler-Notifications' ];
		package: 'Wormhole-Tests' with: [ spec requires: #( 'Wormhole' 'Kepler-SUnit' ) ]
]
