#include "widget.h"
#include <QApplication>
#include <QtWidgets>
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Widget wgt;

    QPushButton *pcmdA = new QPushButton("Button1");
    QPushButton *pcmdB = new QPushButton("Button2");
    QPushButton *pcmdC = new QPushButton("Button3");
    QVBoxLayout *pvbl = new QVBoxLayout;
    pvbl->addWidget(pcmdA);
    pvbl->addWidget(pcmdB);
    pvbl->addWidget(pcmdC);
    wgt.setLayout(pvbl);
    a.setStyle(new CustomStyle);
    wgt.show();

    return a.exec();
}
