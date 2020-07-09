#ifndef SBIT_H
#define SBIT_H

enum bitPos {b0, b1, b2, b3, b4, b5, b6, b7,
             b8, b9, b10, b11, b12, b13, b14, b15,
             b16, b17, b18, b19, b20, b21, b22, b23,
             b24, b25, b26, b27, b28, b29, b30, b31};

//-------------------------------------------------------------------------------------------------------------
class BdataBase
{
public:

    BdataBase() {}
    virtual ~BdataBase() {}

    virtual void setBit(bool state) = 0;
    virtual bool getBit() const = 0;
};

//-------------------------------------------------------------------------------------------------------------
template<typename T>
class Bdata : public BdataBase
{
    T* value_;
    int bitPos_;

public:
    Bdata(T& value, int pos) {value_ = &value; bitPos_ = pos;}
    virtual ~Bdata() {}

    void setBit(bool state)
    {
        if (state) *value_ = (*value_) | static_cast<T>(1) << bitPos_; // включить бит
        else  *value_ = ~((~(*value_)) | (static_cast<T>(1) << bitPos_)); // выключить бит
    }

    bool getBit() const {return (*value_) & (static_cast<T>(1) << bitPos_);}
};

//-------------------------------------------------------------------------------------------------------------
class sbit
{
    BdataBase* bdata_ = nullptr;

public:

    sbit(BdataBase* bdataBase) {this->bdata_ = bdataBase;}
    ~sbit() {delete bdata_;}

    template<typename T>
    operator T() const {return static_cast<T>(bdata_->getBit());}

    template<typename T>
    sbit& operator=(const T& other) {bdata_->setBit(static_cast<bool>(other)); return *this;}

    template<typename T>
    bool operator==(const T& state) const {return bdata_->getBit() == static_cast<bool>(state);}

    template<typename T>
    bool operator!=(const T& state) const {return bdata_->getBit() != static_cast<bool>(state);}

    template<typename T>
    sbit& operator|=(const T& right) {bdata_->setBit(this->bdata_->getBit() | static_cast<bool>(right)); return *this;}

    template<typename T>
    sbit& operator&=(const T& right) {bdata_->setBit(this->bdata_->getBit() & static_cast<bool>(right)); return *this;}

    bool operator~() const {return ~this->bdata_->getBit();}
    bool operator&(const sbit& other) const {return this->bdata_->getBit() & other.bdata_->getBit();}
    bool operator|(const sbit& other) const {return this->bdata_->getBit() | other.bdata_->getBit();}
};

template<typename T>
BdataBase* operator^(T& value, bitPos pos) {return new Bdata<T>(value, pos);}

template<typename T>
void operator|=(T& left, const sbit& right) { left = left | static_cast<T>(right);}

template<typename T>
void operator^=(T& left, const sbit& right) { left = left ^ static_cast<T>(right);}

template<typename T>
T operator*(T left, const sbit& right) { return (left * static_cast<T>(right));}

using sfr = unsigned;

#endif // SBIT_H
