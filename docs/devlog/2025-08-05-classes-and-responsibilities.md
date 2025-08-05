# 2025-08-05 - Use Cases, Domain Classes, and Responsibilites

## Use Cases
Carrying on from yesterday, teambuilding, damage calculation, and bank use cases have been completed for the app. With this, the core functionalities of the app have been addressed.

## Domain Classes and Responsibilities
Using my narrative, candidate classes, and use cases I have finalized my initial set of domain classes and responsibilities. You can find them [here](docs/ood_process/classes-and-responsibilities.md). I elected to forego any "ResourceReport" class in favor of simply generating UI elements in realtime based on the Team/Slot objects, as there is no need to store the resource summaries. Introduction of such a class in the future should be relatively straightforward should I change my mind.

## What's Next
From here, I plan to develop screen flows and screen descriptions to further map out my build. After that's done I hope to select which database framework I will use, though I am partial to Supabase given my experience with it and SQL databases in general.