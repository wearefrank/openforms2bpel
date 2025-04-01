---
sidebar_position: 19
---

# Scheduled Start/Stop WorkflowSelector Receiver
The processing of messages can be started or stopped by a scheduled job. This is done by starting/stopping the receiver of the **_WorkflowSelector_**. This still allows for messages to be delivered from the **_Notificaties API_**, but they won't be processed until the receiver is turned back on. The scheduled starting/stopping of the receiver can be useful if backend services are not available during a set period of time, for example during a backup cycle. By default this scheduled job is not enabled.

### Configure Schedule
The scheduled start and stop job for the **_WorkflowSelector_** can be configured with:
```ini
openforms2bpel.workflows.scheduledStartReceiver.workflowSelector.cronExpression: 0 * 5 * * ?
openforms2bpel.workflows.scheduledStartReceiver.workflowSelector.enabled: false
openforms2bpel.workflows.scheduledStopReceiver.workflowSelector.cronExpression: 0 * 0 * * ?
openforms2bpel.workflows.scheduledStopReceiver.workflowSelector.enabled: false
```

For information on the Quartz Cron syntax and list of examples, visit the [Quartz Scheduler Cron Trigger Documentation](https://www.quartz-scheduler.org/documentation/quartz-2.3.0/tutorials/crontrigger.html).