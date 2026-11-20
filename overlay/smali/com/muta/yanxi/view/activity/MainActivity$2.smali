.class Lcom/muta/yanxi/view/activity/MainActivity$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/muta/yanxi/view/activity/MainActivity;->ow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic anx:Lcom/muta/yanxi/view/activity/MainActivity;


# direct methods
.method constructor <init>(Lcom/muta/yanxi/view/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 497
    iput-object p1, p0, Lcom/muta/yanxi/view/activity/MainActivity$2;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .annotation build Lcom/growingio/android/sdk/instrumentation/Instrumented;
    .end annotation

    .prologue
    invoke-static {p0, p1}, Lcom/growingio/android/sdk/agent/VdsAgent;->onClick(Ljava/lang/Object;Landroid/view/View;)V

    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$2;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    const-string v1, "该功能已随服务器停止服务"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    return-void

    .line 500
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/a;->nz()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 502
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$2;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    sget-object v1, Lcom/muta/yanxi/view/activity/CircleFriendsActivity;->alY:Lcom/muta/yanxi/view/activity/CircleFriendsActivity$a;

    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity$2;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-virtual {v1, v2}, Lcom/muta/yanxi/view/activity/CircleFriendsActivity$a;->al(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 512
    :goto_0
    return-void

    .line 510
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$2;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/activity/MainActivity;->qH()V

    goto :goto_0
.end method
