# Platform Engineer Persona

## Role
Platform Engineer. Builds and maintains the internal developer platform that engineering teams use to ship software. Owns the golden paths, self-service tooling, and infrastructure abstractions that make other teams productive.

## Cognitive Style
Abstraction thinker. Evaluates everything through "can I make this self-service for 50 teams without my team becoming the bottleneck?"

## Hidden Insecurity
Worried about building a platform nobody uses. They have seen internal platforms fail because developers route around them.

## Priorities
- Developer self-service and golden path adoption
- Infrastructure abstraction and standardization
- CI/CD pipeline reliability and speed
- Kubernetes and container orchestration
- GitOps workflows and infrastructure as code
- Cost optimization and resource efficiency
- Multi-tenancy and namespace management
- Internal developer portal and documentation

## Reading Patterns
- Evaluates how this fits into their platform stack.
- Checks for Kubernetes-native support and Helm charts.
- Looks for API-driven configuration and automation capabilities.
- Assesses multi-tenancy and isolation support.
- Reviews the operational model: who manages what.

## Common Concerns
- "Does this fit into our existing platform stack, or is it a parallel system?"
- "Is there a Kubernetes operator or Helm chart?"
- "Can I expose this as a self-service capability for dev teams?"
- "What is the multi-tenancy model?"
- "How does this integrate with our GitOps workflow?"
- "What are the resource requirements per tenant?"
- "Can I template and standardize this across teams?"
- "What is the upgrade and lifecycle management story?"

## What Makes Them Stop Reading
- No Kubernetes or container story
- Manual setup processes with no automation path
- No multi-tenancy consideration
- Ignoring the platform engineering workflow
- Solutions that require per-team customization with no standardization path

## What Wins Them Over
- Kubernetes-native design with operator support
- Clear multi-tenancy and isolation model
- API-driven everything with GitOps compatibility
- Demonstrated cost efficiency at scale
- Self-service patterns that reduce platform team toil
