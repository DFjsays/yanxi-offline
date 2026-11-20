.class Lcom/muta/yanxi/view/activity/MainActivity$19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/muta/yanxi/view/b/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/muta/yanxi/view/activity/MainActivity;->dv(I)V
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
    .line 824
    iput-object p1, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bQ(Ljava/lang/String;)V
    .locals 7

    .prologue
    const/16 v2, 0x8

    const/4 v6, 0x0

    .line 833
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    iget-object v0, v0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acW:Lsilicar/tutu/universal/widget/UniversalFrameLayout;

    invoke-virtual {v0, v6}, Lsilicar/tutu/universal/widget/UniversalFrameLayout;->setVisibility(I)V

    .line 834
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    iget-object v0, v0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acV:Lsilicar/tutu/universal/widget/UniversalFrameLayout;

    invoke-virtual {v0, v2}, Lsilicar/tutu/universal/widget/UniversalFrameLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    iget v0, v0, Lcom/muta/yanxi/view/activity/MainActivity;->oraDvType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_love

    goto :goto_1

    :cond_love

    .line 836
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-static {v0}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v0

    const-string v1, "sync_state"

    invoke-virtual {v0, v1, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 837
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-static {v1}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v1

    const-string v2, "sync_state"

    invoke-virtual {v1, v2, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v1

    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    .line 838
    invoke-static {v2}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v2

    const-string v3, "sync_value"

    invoke-virtual {v2, v3, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v2

    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    .line 839
    invoke-static {v3}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v3

    const-string v4, "sync_cache_value"

    invoke-virtual {v3, v4, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v3

    iget-object v4, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    .line 840
    invoke-static {v4}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v4

    const-string v5, "sync_tap_count"

    invoke-virtual {v4, v5, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v4

    move-object v5, p1

    .line 837
    invoke-static/range {v0 .. v5}, Lcom/muta/yanxi/view/activity/MainActivity;->b(Lcom/muta/yanxi/view/activity/MainActivity;IIIILjava/lang/String;)V

    .line 850
    :goto_0
    return-void

    .line 844
    :goto_1
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-static {v1}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v1

    const-string v2, "sync_state"

    invoke-virtual {v1, v2, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v1

    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    .line 845
    invoke-static {v2}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v2

    const-string v3, "sync_value"

    invoke-virtual {v2, v3, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v2

    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    .line 846
    invoke-static {v3}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v3

    const-string v4, "sync_cache_value"

    invoke-virtual {v3, v4, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v3

    iget-object v4, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    .line 847
    invoke-static {v4}, Lcom/muta/yanxi/view/activity/MainActivity;->i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;

    move-result-object v4

    const-string v5, "sync_tap_count"

    invoke-virtual {v4, v5, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v4

    move-object v5, p1

    .line 844
    invoke-static/range {v0 .. v5}, Lcom/muta/yanxi/view/activity/MainActivity;->a(Lcom/muta/yanxi/view/activity/MainActivity;IIIILjava/lang/String;)V

    goto :goto_0
.end method

.method public onDismiss()V
    .locals 2

    .prologue
    .line 827
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    iget-object v0, v0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acW:Lsilicar/tutu/universal/widget/UniversalFrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalFrameLayout;->setVisibility(I)V

    .line 828
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity$19;->anx:Lcom/muta/yanxi/view/activity/MainActivity;

    iget-object v0, v0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acV:Lsilicar/tutu/universal/widget/UniversalFrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalFrameLayout;->setVisibility(I)V

    .line 829
    return-void
.end method
