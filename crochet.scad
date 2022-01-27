tn=1.5;
dent=5;
taille=5;
large=3;
cro=10;

hauteur=8;


module triangle(x){
    t=1;
    square([tn,taille]);
    translate([tn,0,0]) polygon([[0,0], [0,x-tn], [(x/2)-tn,(x/2)-tn]]);
}
module dents(nb, x=10)
    for(i = [0:1:nb-1]){
        translate([0,x*i,0]) triangle(x);
}

module pincette(dent, taille){
    difference(){
        union(){
            translate([0,dent*taille-tn,0]) square([taille,tn]);
            dents(dent,taille);
            mirror([1,0,0]) translate([-taille,taille/2,0]) dents(dent,taille);
        }
        translate([0,dent*taille,0]) square([taille,taille/2]);
    }
}

module crochet(){
    //square([tn,taille*dent]);
    translate([0,taille*dent-tn,0]) square([large+tn,tn]);
    translate([large+tn,taille*dent-cro,0]) square([tn,cro]);
}

linear_extrude(hauteur) {
    mirror([1,0,0]) crochet();
    pincette(dent,taille);
}