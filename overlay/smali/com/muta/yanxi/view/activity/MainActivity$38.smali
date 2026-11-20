.class Lcom/muta/yanxi/view/activity/MainActivity$38;
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
    .line 483
    iput-object p1, p0, Lcom/muta/yanxi/view/activity/MainActivity$38;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .annotation build Lcom/growingio/android/sdk/instrumentation/Instrumented;
    .end annotation

    .prologue
    invoke-static {p0, p1}, Lcom/growingio/android/sdk/agent/VdsAgent;->onClick(Ljava/lang/Object;Landroid/view/View;)V

    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$38;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    const-string v1, "该功能已随服务器停止服务"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    return-void

    .line 486
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/a;->nz()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 487
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/muta/yanxi/presenter/a/a;->akv:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "index.html?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 488
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity$38;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity$38;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    const/4 v3, 0x1

    invoke-static {v2, v0, v3}, Lcom/muta/yanxi/view/activity/WebActivity;->d(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 493
    :goto_0
    return-void

    .line 490
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$38;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/activity/MainActivity;->qH()V

    goto :goto_0
.end method
