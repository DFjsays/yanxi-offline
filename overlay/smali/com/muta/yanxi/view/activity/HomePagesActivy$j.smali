.class final Lcom/muta/yanxi/view/activity/HomePagesActivy$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/muta/yanxi/view/activity/HomePagesActivy;->ov()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# instance fields
.field final synthetic amD:Lcom/muta/yanxi/view/activity/HomePagesActivy;


# direct methods
.method constructor <init>(Lcom/muta/yanxi/view/activity/HomePagesActivy;)V
    .locals 0

    iput-object p1, p0, Lcom/muta/yanxi/view/activity/HomePagesActivy$j;->amD:Lcom/muta/yanxi/view/activity/HomePagesActivy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2
    .annotation build Lcom/growingio/android/sdk/instrumentation/Instrumented;
    .end annotation

    .prologue
    invoke-static {p0, p1}, Lcom/growingio/android/sdk/agent/VdsAgent;->onClick(Ljava/lang/Object;Landroid/view/View;)V

    .line 90
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/HomePagesActivy$j;->amD:Lcom/muta/yanxi/view/activity/HomePagesActivy;

    iget-object v0, p0, Lcom/muta/yanxi/view/activity/HomePagesActivy$j;->amD:Lcom/muta/yanxi/view/activity/HomePagesActivy;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/muta/yanxi/offline/OfflineProfileActivity;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/muta/yanxi/view/activity/HomePagesActivy;->startActivity(Landroid/content/Intent;)V

    .line 91
    return-void
.end method
