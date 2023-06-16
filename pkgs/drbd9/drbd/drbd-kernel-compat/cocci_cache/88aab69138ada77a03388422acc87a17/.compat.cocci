
// ------------------------------------------------------------------
//  drbd-kernel-compat/cocci/kvfree_rcu_mightsleep__no_present.cocci
// ------------------------------------------------------------------
@@
@@
- kvfree_rcu_mightsleep
+ kvfree_rcu
@@
identifier m, ignored;
@@
static int drbd_compat_show(struct seq_file *m, void *ignored)
{
	...
+	seq_puts(m, "kvfree_rcu_mightsleep__no_present\n");
	return 0;
}

// -------------------------------------------------------------
//  drbd-kernel-compat/cocci/sk_use_task_frag__no_present.cocci
// -------------------------------------------------------------
@@
expression s;
@@
- s->sk_use_task_frag = ...;
@@
identifier m, ignored;
@@
static int drbd_compat_show(struct seq_file *m, void *ignored)
{
	...
+	seq_puts(m, "sk_use_task_frag__no_present\n");
	return 0;
}

// -----------------------------------------------------------
//  drbd-kernel-compat/cocci/timer_shutdown__no_present.cocci
// -----------------------------------------------------------
@@
@@
(
- timer_shutdown
+ del_timer
 (...)
|
- timer_shutdown_sync
+ del_timer_sync
 (...)
)
@@
identifier m, ignored;
@@
static int drbd_compat_show(struct seq_file *m, void *ignored)
{
	...
+	seq_puts(m, "timer_shutdown__no_present\n");
	return 0;
}
