---
sidebar_position: 18
---

# Automatic ErrorStore Retries
ErrorStore entries can be configured for automatic retries via a scheduler. The retry schedule is controlled with a Quartz dialect Cron expression and and an optional maximum retry count. Cron expressions allows for simple **_"At every 30th minute"_** schedules, or finely-grained schedules like **_"At 8:00am every Monday through Friday"_**. Automatic retries are enabled by default with a **_At every 30th minute_** interval and a maximum retry count of **_5_**.


### Enable/Disable Automatic Retries
To enable/disable all automatic retries (unless overriden):
```ini
openforms2bpel.workflows.auto-retry.enabled=true
```

Automatic retries for individual error stores can be controlled with:
```ini
openforms2bpel.workflows.workflow-selector.auto-retry.enabled=${openforms2bpel.workflows.auto-retry.enabled}
openforms2bpel.workflows.add-documents-to-case.auto-retry.enabled=${openforms2bpel.workflows.auto-retry.enabled}
openforms2bpel.workflows.update-payment-command.auto-retry.enabled=${openforms2bpel.workflows.auto-retry.enabled}
openforms2bpel.workflows.send-no-reply-user-email.auto-retry.enabled=${openforms2bpel.workflows.auto-retry.enabled}
```

### Scheduling Configuration
For information on the Quartz Cron syntax and list of examples, visit the [Quartz Scheduler Cron Trigger Documentation](https://www.quartz-scheduler.org/documentation/quartz-2.3.0/tutorials/crontrigger.html).

Configuration for all error stores (unless overriden):
```ini
openforms2bpel.workflows.auto-retry.cron-expression=0 0/30 * * * ?
openforms2bpel.workflows.auto-retry.max-retries=5
```

Configuration for individual error stores can be controlled with:
```ini
openforms2bpel.workflows.workflow-selector.auto-retry.cron-expression=${openforms2bpel.workflows.auto-retry.cron-expression}
openforms2bpel.workflows.workflow-selector.auto-retry.max-retries=${openforms2bpel.workflows.auto-retry.max-retries}
openforms2bpel.workflows.add-documents-to-case.auto-retry.cron-expression=${openforms2bpel.workflows.auto-retry.cron-expression}
openforms2bpel.workflows.add-documents-to-case.auto-retry.max-retries=${openforms2bpel.workflows.auto-retry.max-retries}
openforms2bpel.workflows.update-payment-command.auto-retry.cron-expression=${openforms2bpel.workflows.auto-retry.cron-expression}
openforms2bpel.workflows.update-payment-command.auto-retry.max-retries=${openforms2bpel.workflows.auto-retry.max-retries}
openforms2bpel.workflows.send-no-reply-user-email.auto-retry.cron-expression=${openforms2bpel.workflows.auto-retry.cron-expression}
openforms2bpel.workflows.send-no-reply-user-email.auto-retry.max-retries=${openforms2bpel.workflows.auto-retry.max-retries}
```


