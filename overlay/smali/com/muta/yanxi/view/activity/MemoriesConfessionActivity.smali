.class public Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;
.super Lcom/muta/yanxi/base/b;
.source "SourceFile"


# instance fields
.field private Yr:Lcom/muta/yanxi/c/b/c;

.field anM:Lcom/muta/yanxi/a/i;

.field private anN:Lcom/muta/yanxi/view/c/d;

.field private anO:Ljava/lang/String;

.field private anP:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/muta/yanxi/base/b;-><init>()V

    .line 35
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anP:[I

    return-void

    :array_0
    .array-data 4
        0x7f020185
        0x7f020186
    .end array-data
.end method

.method public static a(Landroid/content/Context;Lcom/muta/yanxi/entity/illustraData;)Landroid/content/Intent;
    .locals 3

    .prologue
    .line 37
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 38
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 39
    const-string v2, "data"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 40
    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 41
    return-object v0
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anO:Ljava/lang/String;

    return-object v0
.end method

.method private a(Lcom/muta/yanxi/entity/illustraData;)V
    .locals 8

    .prologue
    const/4 v7, 0x3

    .line 140
    invoke-virtual {p1}, Lcom/muta/yanxi/entity/illustraData;->getIllpos()I

    move-result v0

    .line 141
    invoke-virtual {p1}, Lcom/muta/yanxi/entity/illustraData;->getDate_days()I

    move-result v1

    .line 142
    invoke-virtual {p1}, Lcom/muta/yanxi/entity/illustraData;->getLocklevel()I

    .line 143
    invoke-virtual {p1}, Lcom/muta/yanxi/entity/illustraData;->getGetalong()I

    move-result v2

    .line 144
    invoke-virtual {p1}, Lcom/muta/yanxi/entity/illustraData;->getIntimatecount()I

    move-result v3

    .line 145
    invoke-virtual {p1}, Lcom/muta/yanxi/entity/illustraData;->getCreate_time()Ljava/lang/String;

    move-result-object v4

    .line 146
    invoke-virtual {p1}, Lcom/muta/yanxi/entity/illustraData;->getPic2x()Ljava/lang/String;

    move-result-object v5

    .line 147
    invoke-virtual {p1}, Lcom/muta/yanxi/entity/illustraData;->getPic3x()Ljava/lang/String;

    move-result-object v6

    .line 148
    iput-object v6, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anO:Ljava/lang/String;

    .line 149
    iget-object v6, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v6, v6, Lcom/muta/yanxi/a/i;->adU:Landroid/widget/ImageView;

    invoke-static {v6}, Lcom/muta/yanxi/offline/OfflineMemories;->loadCg(Landroid/widget/ImageView;)V

    .line 150
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v5

    invoke-static {v5}, Lcom/muta/yanxi/c/b/b;->Z(Landroid/content/Context;)Lcom/muta/yanxi/c/b/b;

    move-result-object v5

    .line 151
    const-string v6, "sync_show_value"

    invoke-virtual {v5, v6, v3}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 153
    iget-object v5, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v5, v5, Lcom/muta/yanxi/a/i;->adC:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, ""

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v1, v1, Lcom/muta/yanxi/a/i;->adE:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, ""

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v1, v1, Lcom/muta/yanxi/a/i;->adH:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v1, v1, Lcom/muta/yanxi/a/i;->adX:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    if-ltz v0, :cond_1

    if-ge v0, v7, :cond_1

    .line 158
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adM:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anP:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 163
    :cond_0
    :goto_0
    return-void

    .line 159
    :cond_1
    if-lt v0, v7, :cond_0

    const/4 v1, 0x6

    if-ge v0, v1, :cond_0

    .line 160
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adM:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anP:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method

.method static synthetic b(Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->qS()V

    return-void
.end method

.method static synthetic c(Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;)Lcom/muta/yanxi/view/c/d;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anN:Lcom/muta/yanxi/view/c/d;

    return-object v0
.end method

.method private qS()V
    .locals 4

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 119
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adW:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    invoke-virtual {v0, v2}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setAlpha(F)V

    .line 120
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adt:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setAlpha(F)V

    .line 121
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adV:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 122
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adA:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 123
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adB:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 125
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adP:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    invoke-static {v0}, Lcom/muta/yanxi/e/a;->bb(Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/muta/yanxi/e/a;->c(Landroid/content/Context;Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v0

    .line 126
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anN:Lcom/muta/yanxi/view/c/d;

    invoke-virtual {v1, v0}, Lcom/muta/yanxi/view/c/d;->cq(Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adW:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    invoke-virtual {v0, v3}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setAlpha(F)V

    .line 129
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adt:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setAlpha(F)V

    .line 130
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adV:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 131
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adA:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 132
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adB:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 133
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 46
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onCreate(Landroid/os/Bundle;)V

    .line 47
    const v0, 0x7f04002f

    invoke-static {p0, v0}, Landroid/a/e;->b(Landroid/app/Activity;I)Landroid/a/g;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/a/i;

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    .line 48
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lybj366533/BasePopup/TranslucentBar/e;->a(Landroid/view/Window;)V

    .line 49
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->oy()V

    .line 50
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .prologue
    .line 53
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onWindowFocusChanged(Z)V

    .line 54
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lybj366533/BasePopup/TranslucentBar/e;->c(Landroid/view/Window;)V

    .line 55
    return-void
.end method

.method protected oo()V
    .locals 4

    .prologue
    .line 58
    const-string v0, "picDetail"

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->aaT:Ljava/lang/String;

    .line 59
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v0

    invoke-static {v0}, Lcom/muta/yanxi/c/b/c;->aa(Landroid/content/Context;)Lcom/muta/yanxi/c/b/c;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    .line 61
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    const-string v1, "Headimg"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/muta/yanxi/c/b/c;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    const-string v2, "Realname"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lcom/muta/yanxi/c/b/c;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 64
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v2, v2, Lcom/muta/yanxi/a/i;->adY:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v1, v1, Lcom/muta/yanxi/a/i;->adL:Landroid/widget/ImageView;

    invoke-static {p0, v1, v0}, Lcom/muta/yanxi/e/i;->a(Landroid/content/Context;Landroid/widget/ImageView;Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/entity/illustraData;

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->a(Lcom/muta/yanxi/entity/illustraData;)V

    .line 67
    return-void
.end method

.method protected ov()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 71
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adV:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 72
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adA:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 73
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adB:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 75
    new-instance v0, Lcom/muta/yanxi/view/c/d;

    invoke-direct {v0, p0}, Lcom/muta/yanxi/view/c/d;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anN:Lcom/muta/yanxi/view/c/d;

    .line 76
    return-void
.end method

.method protected ow()V
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adS:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity$1;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity$1;-><init>(Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;)V

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adT:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity$2;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity$2;-><init>(Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;)V

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adQ:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity$3;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity$3;-><init>(Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;)V

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;->anM:Lcom/muta/yanxi/a/i;

    iget-object v0, v0, Lcom/muta/yanxi/a/i;->adt:Landroid/widget/ImageButton;

    new-instance v1, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity$4;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity$4;-><init>(Lcom/muta/yanxi/view/activity/MemoriesConfessionActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    return-void
.end method

.method protected ox()V
    .locals 0

    .prologue
    .line 116
    return-void
.end method
