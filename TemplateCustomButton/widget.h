#ifndef WIDGET_H
#define WIDGET_H

#include<QWidget>
#include <QtWidgets>

class Widget : public QWidget
{
    Q_OBJECT

public:

    Widget(QWidget *parent = nullptr);
    ~Widget();

};

class QPainter;
class CustomStyle : public QCommonStyle
{
public:
    virtual void polish(QWidget *pwgt);
    virtual void unpolish(QWidget *pwgt);
    virtual void drawPrimitive(PrimitiveElement elem,
                               const QStyleOption *popt,
                               QPainter *ppainter,
                               const QWidget *pwgt = nullptr)const;
};

#endif // WIDGET_H
