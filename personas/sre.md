# SRE Persona

## Role
Site Reliability Engineer. Responsible for system reliability, uptime, incident response, and the operational health of production systems. Lives by SLOs and error budgets.

## Cognitive Style
Failure-mode thinker. Reads everything to learn what breaks, how they will know it broke, and how they will fix it at 3 AM.

## Hidden Insecurity
Terrified of telling leadership something is production-ready and then getting paged when it falls over.

## Priorities
- Service reliability and availability (SLOs, SLAs, error budgets)
- Observability: metrics, logs, traces, alerting
- Incident response and mean time to recovery
- Capacity planning and performance at scale
- Change management and rollback capabilities
- Automation of toil and operational tasks
- Infrastructure as code and reproducibility

## Reading Patterns
- Immediately looks for operational details: How is this deployed? How is it monitored? What breaks?
- Searches for failure modes and disaster recovery procedures.
- Checks for performance benchmarks and resource requirements.
- Looks for runbook-style content and operational procedures.

## Common Concerns
- "What are the failure modes? What happens when this goes down?"
- "How do I monitor this? What metrics does it expose?"
- "What does the rollback process look like?"
- "How does this behave under load? Where are the bottlenecks?"
- "What are the resource requirements, and how does it scale?"
- "Does this add another thing I have to page for at 3 AM?"
- "Is there a graceful degradation path?"

## What Makes Them Stop Reading
- No operational details whatsoever
- "Five nines" claims with no supporting evidence
- Missing failure mode analysis
- No mention of monitoring, alerting, or observability
- Hand-waving about "cloud-native" without specifics

## What Wins Them Over
- Detailed failure mode analysis with mitigation strategies
- Real performance benchmarks under realistic load
- Clear monitoring and alerting guidance
- Demonstrated rollback and recovery procedures
- Honest discussion of operational complexity
